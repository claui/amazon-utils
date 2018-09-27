on run(argv)
	set contactURL to ¬
		"https://www.amazon.de/hz/contact-us"

	log "Requesting page: " & contactURL
	set currentTab to my openTab(contactURL)
	my waitForPageToBeReady(currentTab, contactURL)

	tell application "Google Chrome"
		log "Starting JavaScript execution; " ¬
			& "see developer console for details"

		execute currentTab javascript "
			var format = '[amazon-utils] %s';
			var nonOrderButtonId = 27;
			var preOrderOptionId = 45;

			var waitForElementById = (id) =>
				waitForElement(() => document.getElementById(id));

			var waitForElement = function (elementSelector) {
				console.log(format, 'Waiting for element');

				return new Promise((resolve, reject) => {
					if (elementSelector === undefined) {
						reject(new Error('No element selector given'));
					}

					var pollId = setInterval(function () {
						var element = elementSelector();

						if (element !== undefined
							&& element.style !== undefined
							&& element.style.value === undefined) {

							clearInterval(pollId);
							console.log(format, 'Found element');
							resolve(element);
						}
					}, 500);
				});
			};

			var asyncRun = async function () {
				console.log(format, 'Waiting for non-order button');

				var nonOrderButton =
					await waitForElementById(nonOrderButtonId);

				console.log(format, 'Switching to non-order section');
				nonOrderButton.dispatchEvent(new Event('click'));

				console.log(format, 'Waiting for second select box');
				var secondNodeSelectBox =
					await waitForElementById('cu-select-secondNode');

				console.log(format, 'Selecting second node');
				secondNodeSelectBox.value = preOrderOptionId;
				secondNodeSelectBox.dispatchEvent(new Event('change'));

				console.log(format, 'Waiting for button wrapper');
				var chatButtonWrapper = await waitForElement(() =>
					document
						.getElementsByClassName('cu-contact-channel-chat')[0]);

				console.log(format, 'Waiting for button');
				var chatButton = await waitForElement(() =>
					chatButtonWrapper
						.getElementsByClassName('cu-contact-channel-btn')[0]);

				console.log(format, 'Clicking button');
				chatButton.dispatchEvent(new Event('click'));

				console.log(format, 'Done');
			};

			asyncRun();

			'Done'
		"
	end tell
end run

on openTab(anURL)
	tell application "Google Chrome"
		activate

		set isRequestedPageLoaded to ¬
			window 1's active tab's URL starts with anURL

		if isRequestedPageLoaded is false then
			tell window 1 to make new tab
			set window 1's active tab's URL to anURL
		end if

		return window 1's active tab
	end tell
end openTab

on waitForPageToBeReady(currentTab, contactURL)
	using terms from application "Google Chrome"
		repeat
			if currentTab's loading is true then
				log "Page loading, waiting …"
				delay 0.5
			else
				if currentTab's URL starts with contactURL then
					log "Target page loaded"
					exit
				else
					log "Redirection detected, waiting …"
					delay 0.5
				end if
			end if
		end repeat
	end using terms from
end waitForPageToBeReady
