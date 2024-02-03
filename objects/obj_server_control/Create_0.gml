/// @desc Create listener

root = "highscores";
listener = FirebaseFirestore(root).Listener();

data = -1;

scoreInput = -1


sort_score = function(_a, _b)
{
	return _b.score - _a.score;
}

add_score = function()
{
	var _doc = json_stringify(
		{
			name: get_string("Gamer Tag: ", ""),
			score: scoreInput
		}
	);
	FirebaseFirestore(root).Set(_doc);
}

delete_score = function()
{
	var _doc = FirebaseFirestore(root).Child(data[0].id);
	_doc.Delete();
}