abstract class GoogleMapState {}

class InitState extends GoogleMapState{}
class ChangeCurrentPositionState extends GoogleMapState{}
class GetLocationSuccessState extends GoogleMapState{}
class GetLocationErorrState extends GoogleMapState{}
class AnimateSuccessState extends GoogleMapState{}
class AnimateErorrState extends GoogleMapState{}
