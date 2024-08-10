# Bloc_Connectivity

A flutter application to check if the app is connected to internet using bloc.

## Application Flow: CounterBloc and InternetBloc

### InternetBloc Initialization:
The InternetBloc is initialized with an instance of Connectivity from the connectivity_plus package. It starts in the InternetLoading state.

**Event Handling:**
    The InternetBloc subscribes to the onConnectivityChanged stream to monitor connectivity changes.
    Based on the connectivity change:
    Wi-Fi Connection: Dispatches InternetConnectedEvent with ConnectionType.wifi.
    Mobile Data Connection: Dispatches InternetConnectedEvent with ConnectionType.mobile.
    No Connection: Dispatches InternetDisconnectedEvent.

**State Management:**
    The bloc listens to these events and updates its state accordingly:
    InternetConnected (with ConnectionType.wifi or ConnectionType.mobile).
    InternetDisconnected. 
### CounterBloc Initialization:
   The CounterBloc is initialized with a dependency on the InternetBloc. It starts with an initial CounterState where the counter is set to 0.
**Subscribing to InternetBloc**: 
   The CounterBloc subscribes to the stream of state changes from InternetBloc.
   Event Handling:
   Depending on the InternetState:
   Wi-Fi Connection: Dispatches CounterIncrement event.
   Mobile Data Connection: Dispatches CounterDecrement event.
 **State Management:**
   Processes the dispatched events to update its state:
   CounterIncrement: Increases the counter.
   CounterDecrement: Decreases the counter.


# StreamSubscription in Dart

## What is `StreamSubscription`?

A `StreamSubscription` is an object that represents a subscription to a stream in Dart. It allows you to listen to a stream of events and handle them as they arrive. When you subscribe to a stream, you get a `StreamSubscription` instance, which provides methods to manage the subscription.

## Key Responsibilities of `StreamSubscription`:
1. **Listening to a Stream:** It listens for data, error, and done events emitted by the stream.
2. **Managing the Subscription**:
    - **pause:** Temporarily stops the subscription from receiving events.
    - **resume:** Resumes the subscription, allowing it to start receiving events again.
    - **cancel:** Stops listening to the stream entirely and cleans up any resources. This is important to prevent memory leaks.
3. **Handling Events:**
    - You can define how to handle each event (data, error, and done) when creating the subscription.

## Typical Use Cases for `StreamSubscription`:

1. **Listening to Connectivity Changes:**
    - In scenarios where you need to respond to changes in network connectivity (e.g., Wi-Fi, mobile data), a `StreamSubscription` is used to listen to the connectivity stream.
    - Example: The `InternetBloc` listens to connectivity changes using a `StreamSubscription` to update its state.

2. **Listening to User Interactions:**
    - In reactive applications, you might listen to user interactions, such as button clicks or form submissions, that are emitted as events on a stream.

3. **Real-Time Data Updates:**
    - When dealing with real-time data, such as incoming messages, live sensor data, or stock prices, you would use a `StreamSubscription` to listen for and react to these updates.

4. **Handling Asynchronous Operations:**
    - When an asynchronous operation emits multiple results over time, you can subscribe to a stream of those results.

## Example Scenario:

In the context of `InternetBloc`, the `StreamSubscription` is used as follows:

### Subscription to Connectivity Changes:
```dart
StreamSubscription? connectivityStreamSubscription;

connectivityStreamSubscription = connectivity.onConnectivityChanged.listen((connectivityResult) {
  // Handle the connectivity change (Wi-Fi, Mobile Data, or None)
}); 
```


