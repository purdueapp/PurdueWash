// This sample demonstrates handling intents from an Alexa skill using the Alexa Skills Kit SDK (v2).
// Please visit https://alexa.design/cookbook for additional examples on implementing slots, dialog management,
// session persistence, api calls, and more.
const Alexa = require('ask-sdk-core');
const http = require('http');

const rooms = { 'Cary': 0, 'Earhart': 2, 'Harrison': 3, 'Hawkins': 4, 'Hillenbrand': 5, 'McCutcheon': 6,
                'Meredith': 7, 'Owen': 9, 'Shreve': 10, 'Tarkington': 11, 'Third': 12, 'Wiley': 13, 'Windsor': 14 };

const getData = function() {
    return new Promise(resolve => {
      http.get('http://data.cs.purdue.edu:8421', (resp) => {
        let data = '';
    
        // A chunk of data has been recieved.
        resp.on('data', (chunk) => {
            data += chunk;
        });
        
        // The whole response has been received. Print out the result.
        resp.on('end', () => {
            resolve(data);
        });
    
        }).on("error", (err) => {
          console.log("Error: " + err.message);
          resolve(500);
        });
    });
}

const getSpeechText = async function(roomId) {
    const washData = JSON.parse(await getData().then(function (data) {
        return data;
    }));
    
    return `There are ${washData[roomId]["AvailableWashers"]} washers available and ${washData[roomId]["AvailableDryers"]} dryers available`;
}


const LaunchRequestHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'LaunchRequest';
    },
    handle(handlerInput) {
        const speechText = 'Welcome, you can say Hello or Help. Which would you like to try?';
        return handlerInput.responseBuilder
            .speak(speechText)
            .reprompt(speechText)
            .getResponse();
    }
};


const CaryIntentHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'IntentRequest'
            && handlerInput.requestEnvelope.request.intent.name === 'CaryIntent';
    },
    async handle(handlerInput) {
        const washData = JSON.parse(await getData().then(function (data) {
            return data;
        }));

        const speechText = await getSpeechText(rooms['Cary']);
        return handlerInput.responseBuilder
            .speak(speechText)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};



const EarhartIntentHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'IntentRequest'
            && handlerInput.requestEnvelope.request.intent.name === 'EarhartIntent';
    },
    async handle(handlerInput) {
        const washData = JSON.parse(await getData().then(function (data) {
            return data;
        }));

        const speechText = await getSpeechText(rooms['Earhart']);
        return handlerInput.responseBuilder
            .speak(speechText)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};

const HarrisonIntentHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'IntentRequest'
            && handlerInput.requestEnvelope.request.intent.name === 'HarrisonIntent';
    },
    async handle(handlerInput) {
        const washData = JSON.parse(await getData().then(function (data) {
            return data;
        }));

        const speechText = await getSpeechText(rooms['Harrison']);
        return handlerInput.responseBuilder
            .speak(speechText)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};

const HawkinsIntentHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'IntentRequest'
            && handlerInput.requestEnvelope.request.intent.name === 'HawkinsIntent';
    },
    async handle(handlerInput) {
        const washData = JSON.parse(await getData().then(function (data) {
            return data;
        }));

        const speechText = await getSpeechText(rooms['Hawkins']);
        return handlerInput.responseBuilder
            .speak(speechText)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};

const HillenbrandIntentHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'IntentRequest'
            && handlerInput.requestEnvelope.request.intent.name === 'HillenbrandIntent';
    },
    async handle(handlerInput) {
        const washData = JSON.parse(await getData().then(function (data) {
            return data;
        }));

        const speechText = await getSpeechText(rooms['Hillenbrand']);
        return handlerInput.responseBuilder
            .speak(speechText)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};

const McCutcheonIntentHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'IntentRequest'
            && handlerInput.requestEnvelope.request.intent.name === 'McCutcheonIntent';
    },
    async handle(handlerInput) {
        const washData = JSON.parse(await getData().then(function (data) {
            return data;
        }));

        const speechText = await getSpeechText(rooms['McCutcheon']);
        return handlerInput.responseBuilder
            .speak(speechText)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};

const MeredithIntentHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'IntentRequest'
            && handlerInput.requestEnvelope.request.intent.name === 'MeredithIntent';
    },
    async handle(handlerInput) {
        const washData = JSON.parse(await getData().then(function (data) {
            return data;
        }));

        const speechText = await getSpeechText(rooms['Meredith']);
        return handlerInput.responseBuilder
            .speak(speechText)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};

const OwenIntentHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'IntentRequest'
            && handlerInput.requestEnvelope.request.intent.name === 'OwenIntent';
    },
    async handle(handlerInput) {
        const washData = JSON.parse(await getData().then(function (data) {
            return data;
        }));

        const speechText = await getSpeechText(rooms['Owen']);
        return handlerInput.responseBuilder
            .speak(speechText)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};

const ShreveIntentHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'IntentRequest'
            && handlerInput.requestEnvelope.request.intent.name === 'ShreveIntent';
    },
    async handle(handlerInput) {
        const washData = JSON.parse(await getData().then(function (data) {
            return data;
        }));

        const speechText = await getSpeechText(rooms['Shreve']);
        return handlerInput.responseBuilder
            .speak(speechText)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};

const TarkingtonIntentHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'IntentRequest'
            && handlerInput.requestEnvelope.request.intent.name === 'TarkingtonIntent';
    },
    async handle(handlerInput) {
        const washData = JSON.parse(await getData().then(function (data) {
            return data;
        }));

        const speechText = await getSpeechText(rooms['Tarkington']);
        return handlerInput.responseBuilder
            .speak(speechText)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};

const ThirdIntentHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'IntentRequest'
            && handlerInput.requestEnvelope.request.intent.name === 'ThirdIntent';
    },
    async handle(handlerInput) {
        const washData = JSON.parse(await getData().then(function (data) {
            return data;
        }));

        const speechText = await getSpeechText(rooms['Third']);
        return handlerInput.responseBuilder
            .speak(speechText)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};

const WileyIntentHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'IntentRequest'
            && handlerInput.requestEnvelope.request.intent.name === 'WileyIntent';
    },
    async handle(handlerInput) {
        const washData = JSON.parse(await getData().then(function (data) {
            return data;
        }));

        const speechText = await getSpeechText(rooms['Wiley']);
        return handlerInput.responseBuilder
            .speak(speechText)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};

const WindsorIntentHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'IntentRequest'
            && handlerInput.requestEnvelope.request.intent.name === 'WindsorIntent';
    },
    async handle(handlerInput) {
        const washData = JSON.parse(await getData().then(function (data) {
            return data;
        }));

        const speechText = await getSpeechText(rooms['Windsor']);
        return handlerInput.responseBuilder
            .speak(speechText)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};

const HelloWorldIntentHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'IntentRequest'
            && handlerInput.requestEnvelope.request.intent.name === 'HelloWorldIntent';
    },
    handle(handlerInput) {
        const speechText = 'Hello World!';
        return handlerInput.responseBuilder
            .speak(speechText)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};
const HelpIntentHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'IntentRequest'
            && handlerInput.requestEnvelope.request.intent.name === 'AMAZON.HelpIntent';
    },
    handle(handlerInput) {
        const speechText = 'You can say hello to me! How can I help?';

        return handlerInput.responseBuilder
            .speak(speechText)
            .reprompt(speechText)
            .getResponse();
    }
};
const CancelAndStopIntentHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'IntentRequest'
            && (handlerInput.requestEnvelope.request.intent.name === 'AMAZON.CancelIntent'
                || handlerInput.requestEnvelope.request.intent.name === 'AMAZON.StopIntent');
    },
    handle(handlerInput) {
        const speechText = 'Goodbye!';
        return handlerInput.responseBuilder
            .speak(speechText)
            .getResponse();
    }
};
const SessionEndedRequestHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'SessionEndedRequest';
    },
    handle(handlerInput) {
        // Any cleanup logic goes here.
        return handlerInput.responseBuilder.getResponse();
    }
};

// The intent reflector is used for interaction model testing and debugging.
// It will simply repeat the intent the user said. You can create custom handlers
// for your intents by defining them above, then also adding them to the request
// handler chain below.
const IntentReflectorHandler = {
    canHandle(handlerInput) {
        return handlerInput.requestEnvelope.request.type === 'IntentRequest';
    },
    handle(handlerInput) {
        const intentName = handlerInput.requestEnvelope.request.intent.name;
        const speechText = `You just triggered ${intentName}`;

        return handlerInput.responseBuilder
            .speak(speechText)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};

// Generic error handling to capture any syntax or routing errors. If you receive an error
// stating the request handler chain is not found, you have not implemented a handler for
// the intent being invoked or included it in the skill builder below.
const ErrorHandler = {
    canHandle() {
        return true;
    },
    handle(handlerInput, error) {
        console.log(`~~~~ Error handled: ${error.message}`);
        const speechText = `Sorry, I couldn't understand what you said. Please try again.`;

        return handlerInput.responseBuilder
            .speak(speechText)
            .reprompt(speechText)
            .getResponse();
    }
};

// This handler acts as the entry point for your skill, routing all request and response
// payloads to the handlers above. Make sure any new handlers or interceptors you've
// defined are included below. The order matters - they're processed top to bottom.
exports.handler = Alexa.SkillBuilders.custom()
    .addRequestHandlers(
        LaunchRequestHandler,
        HelloWorldIntentHandler,
        CaryIntentHandler,
        EarhartIntentHandler,
        HarrisonIntentHandler,
        HawkinsIntentHandler,
        HillenbrandIntentHandler,
        McCutcheonIntentHandler,
        MeredithIntentHandler,
        OwenIntentHandler,
        ShreveIntentHandler,
        TarkingtonIntentHandler,
        ThirdIntentHandler,
        WileyIntentHandler,
        WindsorIntentHandler,
        HelpIntentHandler,
        CancelAndStopIntentHandler,
        SessionEndedRequestHandler,
        IntentReflectorHandler) // make sure IntentReflectorHandler is last so it doesn't override your custom intent handlers
    .addErrorHandlers(
        ErrorHandler)
    .lambda();

