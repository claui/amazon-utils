on run(argv)
	set contactURL to ¬
		"https://www.amazon.de/gp/help/customer/contact-us"

	log "Requesting page: " & contactURL
	set currentTab to my openTab(contactURL)
	my waitForPageToBeReady(currentTab, contactURL)

	tell application "Google Chrome"
		log "Executing JavaScript"

		execute currentTab javascript "
			document
				.getElementById('SelIssue2')
				.value = 25
			document
				.getElementById('SelIssue2')
				.dispatchEvent(new Event('change'));
			document
				.getElementById('SelIssue3')
				.value = 29
			document
				.getElementById('SelIssue3')
				.dispatchEvent(new Event('change'));

			var chatButtonPrimary = document
				.getElementById('chatButtonPrimary');

			var intervalId = setInterval(function () {
			  var styleValue = chatButtonPrimary.attributes.style.value;
				if (styleValue === '') {
					clearInterval(intervalId);
					chatButtonPrimary
						.firstChild.dispatchEvent(new Event('click'));
				}
			}, 500);
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
					log "Done"
					exit
				else
					log "Redirection detected, waiting …"
					delay 0.5
				end if
			end if
		end repeat
	end using terms from
end waitForPageToBeReady
