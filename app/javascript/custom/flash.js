document.addEventListener('turbo:load', function() {

    // Function to check if #flash_message has children and handle removal
    function handleFlashMessage() {
        const flashMessage = document.querySelector("#flash_message");
        const fadeOut = document.querySelector("#fadeout")

        // Check if #flash_message exists and has children
        if (flashMessage && flashMessage.children.length > 0) {
            // Hide #flash_message after 3 seconds
            setTimeout(function() {
                fadeOut.classList.add("hidden");
            }, 5000);
        }
    }

    // Initial check on turbo:load
    handleFlashMessage();

    // MutationObserver to watch for changes under document.body
    const observer = new MutationObserver(function(mutationsList) {
        for (let mutation of mutationsList) {
            // Check if #flash_message or its descendants are modified
            if (mutation.target.id === 'flash_message' || mutation.target.closest('#flash_message')) {
                handleFlashMessage();
                break;
            }
        }
    });

    // Start observing changes under document.body
    observer.observe(document.body, { childList: true, subtree: true });
});
