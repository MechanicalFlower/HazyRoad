extends Node

enum State {
	UNKNOWN,
	INTERACT,
	DIALOGUE,
}

var state: State = State.INTERACT

var playing_start_time: float
var playing_end_time: float
var collectable_founded: int = 0
