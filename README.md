# states
 Search App using bloc pattern

# Description
 This app will prompt the user to input a member name, if the name is in the dummyRepository in stat_repository.dart 
 the detail page will display data, otherwise an error message will appear.

# Bloc
   - bloc.dart 
    This File is for making imports simple throughout project.
   
   - stat_bloc.dart  
   ```
    class StatBloc extends Bloc<StatEvent, StatState> {
    final StatRepository statRepository;   # Dummy Repository
         
    StatBloc(this.statRepository);         #Constructor

    @override
    StatState get initialState => StatInitial();   #InitialState must always be here

    @override
    Stream<StatState> mapEventToState(       
    StatEvent event,
    ) async* {
    yield StatLoading();      # State to display loading bar

    if (event is GetStat) {   # State will change depending on whether name is found 
      try {
        final stat = await statRepository.fetchStat(event.memberName);
        yield StatLoaded(stat);
      } on NetworkError {
        yield StatError('This Member is Not Part of the App Team!');
      }
     }
    }

    }
  ```

   - stat_event.dart  
   ```
    # Events go from the UI to the bloc, we only have one event in our app which is getStat. 
    # This event is fired off my inputting a name in the search bar.
    abstract class StatEvent extends Equatable {
    const StatEvent();
    }

    class GetStat extends StatEvent {
    final String memberName;

    const GetStat(this.memberName);
 
    @override
    List<Object> get props => [memberName];
    }
   ```

   - stat_state.dart  
   ```
   # We only have four states or four phases possible in our app
   ```

# stat_search_page.dart
   
   ```
   # Here we will need to close memberBloc with memberBloc.close() 
   # It's the same concept as unsubscribing to the observable, still trying to understand that part.
   void submitMemberName(BuildContext context, String memberName) {    
    final memberBloc = BlocProvider.of<StatBloc>(context);
    memberBloc.add(GetStat(memberName));
  }
   ```
  
   
    

      