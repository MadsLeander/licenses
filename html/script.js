window.onload = (e) => {
	window.addEventListener('message', onMessageRecieved);
};

function onMessageRecieved(event){
	let item = event.data;

	if (item && item.type === 'licenses:MSG') {

		if (item.format !== undefined) {
			if (item.format == 'driver_license') {
				$("#id-card").css("background", 'url("images/background.png")');
			} else {
				$("#id-card").css("background", 'url("images/background2.png")');
			}
		}

		if (item.active) {
			$("#id-card").fadeIn(500);

		} else if (!item.active) {
			$("#id-card").fadeOut(500);

		} else {
			$("#id-card").hide();
		}

		let data = item.data
		if (data !== undefined) {
			if (data.Image !== undefined) {
				$("#image").attr("src", data.Image);
			} else {
				$("#image").attr("src", "images/placeholder.png");
			}

			$('#last-name').text(data.LastName);
			$('#first-name').text(data.FirstName);
			$('#dob').text(data.DOB);
			$('#citizen-id').text(data.CitizenID);
			$('#signature').text(data.FirstName+" "+data.LastName);
			$('#issue').text(data.Issue);
			$('#sex').text(data.Sex);
			$('#hair').text(data.Hair);
			$('#height').text(data.Height);
			$('#eyes').text(data.Eyes);
		};
	}
}
