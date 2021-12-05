(async() => {
    const lang = 'pt-BR'
    const voiceIndex = 1

    const speak = async(text) => {
        if (!speechSynthesis) { return }
        const message = new SpeechSynthesisUtterance(text)
        message.voice = await chooseVoice()
        speechSynthesis.speak(message)
    }

    const getVoices = () => {
        return new Promise((resolve) => {
            let voices = speechSynthesis.getVoices()
            if (voices.length) {
                resolve(voices)
                return
            }
            speechSynthesis.onvoiceschanged = () => {
                voices = speechSynthesis.getVoices();
                resolve(voices)
            }
        })
    }

    const chooseVoice = async() => {
        const voices = (await getVoices()).filter((voice) => voice.lang == lang)
        return new Promise((resolve) => {
            resolve(voices[voiceIndex])
        })
    }

    speak('Olá Hugo, seja bem-vindo novamente!')
})()