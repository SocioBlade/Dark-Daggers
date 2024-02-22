/// @desc Draw database

draw_set_halign(fa_left);

if data == -1
{
	draw_text_transformed(48, 88, "#HighScore Locked#\n#Come back later!#", 0.3, 0.3, 0);
}
else
{
	draw_text_transformed(48, 88, "Global Top 10:", 0.3, 0.3, 0);
	
	for (var i = 0; i < 10; i++)
	{
		var _doc = data[i];
		draw_text_transformed(48, 112 + (16 * i), $"{_doc.name}: {_doc.score}", 0.2, 0.2, 0);
	}
}