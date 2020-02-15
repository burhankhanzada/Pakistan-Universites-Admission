class Campus implements Comparable<Campus> {
  final String name, address, phone, website, email;

  Campus({this.name, this.address, this.phone, this.website, this.email});

  @override
  int compareTo(Campus other) {
    return name.compareTo(other.name);
  }
}
