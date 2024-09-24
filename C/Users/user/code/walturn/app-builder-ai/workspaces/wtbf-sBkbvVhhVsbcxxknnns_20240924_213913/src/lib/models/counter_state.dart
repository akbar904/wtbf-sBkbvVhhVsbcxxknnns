
class CounterState {
	final int value;

	CounterState(this.value);

	Map<String, dynamic> toJson() {
		return {'value': value};
	}

	static CounterState fromJson(Map<String, dynamic> json) {
		return CounterState(json['value']);
	}
}
