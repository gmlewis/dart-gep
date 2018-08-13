// -*- compile-command: "pushd .. && ./df.sh && popd && dart main.dart"; -*-

import 'package:gep/gep.dart';
import 'package:gym/gym.dart';

const defaultNumEpisodes = 20;
const defaultNumSteps = 100;

main(List<String> arguments) async {
  // TODO: get numEpisodes and numSteps from command-line.
  final numEpisodes = defaultNumEpisodes;
  final numSteps = defaultNumSteps;

  var client = GymClient(debug: true);

  // Create environment instance.
  var id = await client.create('Copy-v0');
  print('id=$id');

  // Test space information APIs.
  var actionSpace = await client.actionSpace(id);
  print('actionSpace=$actionSpace');
  // actionSpace=ActionSpace(name: Tuple, spaces: [Space(name: Discrete, n: 2), Space(name: Discrete, n: 2), Space(name: Discrete, n: 5)])
  var observationSpace = await client.observationSpace(id);
  print('observationSpace=$observationSpace');
  // observationSpace=Space(name: Discrete, n: 6)

  var model = GEP.fromOpenAI(actionSpace, observationSpace);

  // Start monitoring to a temp directory.
  await client.startMonitor(id, '/tmp/copy-monitor');

  // Run through an episode.
  for (var episode = 1; episode <= numEpisodes; episode++) {
    print('\nStarting episode #$episode...');
    var obs = await client.reset(id);
    print('First observation: $obs');
    for (var stepNum = 1; stepNum <= numSteps; stepNum++) {
      var action = model.getAction(obs);
      print('Taking action: $action');

      // Take the action, getting a new observation, a reward,
      // and a flag indicating if the episode is done.
      var stepResult = await client.step(id, action);
      obs = stepResult.observation;
      print('reward: ${stepResult.reward}, -- observation: $obs');
      if (stepResult.done) {
        print('Episode #$episode finished after $stepNum steps.');
        break;
      }
      model.evolve(stepResult.reward);
    }
  }

  await client.closeMonitor(id);
  await client.close(id);
}
