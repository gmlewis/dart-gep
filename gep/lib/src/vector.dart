// -*- compile-command: "cd ../.. && ./df.sh"; -*-

/// Vector represents a list of type T.
abstract class Vector<T> {
  Vector(this.data);

  List<T> data;

  // Too bad '+' isn't defined for class 'Object'!!!
  Vector<T> operator +(Vector<T> other);
  Vector<T> operator -(Vector<T> other);
  Vector<T> operator *(Vector<T> other);
  // Vector<T> operator ==(dynamic other);

  String toString() {
    var datum = List.generate(data.length, (i) => "${data[i]}");
    return "[${datum.join(",")}]";
  }

  int compareTo(Vector<T> other);
}

class VectorDouble extends Vector<double> {
  VectorDouble(List<double> data) : super(data);

  // Macro support (like Elixir) would be nice here.
  @override
  Vector<double> operator +(Vector<double> other) {
    if (data.length != other.data.length)
      return VectorDouble([]); // Vectors must be same length.
    return VectorDouble(List.generate<double>(
        data.length, (index) => data[index] + other.data[index]));
  }

  @override
  Vector<double> operator -(Vector<double> other) {
    if (data.length != other.data.length)
      return VectorDouble([]); // Vectors must be same length.
    return VectorDouble(List.generate<double>(
        data.length, (index) => data[index] - other.data[index]));
  }

  @override
  Vector<double> operator *(Vector<double> other) {
    if (data.length != other.data.length)
      return VectorDouble([]); // Vectors must be same length.
    var mult = List.generate<double>(
        data.length, (index) => data[index] * other.data[index]);
    var value = mult.reduce((p, e) => p + e);
    return VectorDouble([value]);
  }

  @override
  int compareTo(Vector<double> other) {
    if (data.length != other.data.length)
      return data.length - other.data.length;
    for (var i = 0; i < data.length; i++) {
      if (data[i] < other.data[i]) return -1;
      if (data[i] > other.data[i]) return 1;
    }
    return 0;
  }

  @override
  bool operator ==(dynamic other) {
    if (!(other is VectorDouble)) return false;
    if (data.length != other.data.length) return false;
    for (var i = 0; i < data.length; i++) {
      if (data[i] < other.data[i]) return false;
      if (data[i] > other.data[i]) return false;
    }
    return true;
  }

  @override
  int get hashCode => data.hashCode;
}

class VectorInt extends Vector<int> {
  VectorInt(List<int> data) : super(data);

  // Macro support (like Elixir) would be nice here.
  @override
  Vector<int> operator +(Vector<int> other) {
    if (data.length != other.data.length)
      return VectorInt([]); // Vectors must be same length.
    return VectorInt(List.generate<int>(
        data.length, (index) => data[index] + other.data[index]));
  }

  @override
  Vector<int> operator -(Vector<int> other) {
    if (data.length != other.data.length)
      return VectorInt([]); // Vectors must be same length.
    return VectorInt(List.generate<int>(
        data.length, (index) => data[index] - other.data[index]));
  }

  @override
  Vector<int> operator *(Vector<int> other) {
    if (data.length != other.data.length)
      return VectorInt([]); // Vectors must be same length.
    var mult = List.generate<int>(
        data.length, (index) => data[index] * other.data[index]);
    var value = mult.reduce((p, e) => p + e);
    return VectorInt([value]);
  }

  @override
  int compareTo(Vector<int> other) {
    if (data.length != other.data.length)
      return data.length - other.data.length;
    for (var i = 0; i < data.length; i++) {
      if (data[i] < other.data[i]) return -1;
      if (data[i] > other.data[i]) return 1;
    }
    return 0;
  }

  @override
  bool operator ==(dynamic other) {
    if (!(other is VectorInt)) return false;
    if (data.length != other.data.length) return false;
    for (var i = 0; i < data.length; i++) {
      if (data[i] < other.data[i]) return false;
      if (data[i] > other.data[i]) return false;
    }
    return true;
  }

  @override
  int get hashCode => data.hashCode;
}
