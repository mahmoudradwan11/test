abstract class OnlineStates {}

class InitOnlineState extends OnlineStates {}
class CreateDatabaseState extends OnlineStates {}

class ErrorCreateDatabaseState extends OnlineStates {}

class InsertCartState extends OnlineStates {}

class ErrorInsertCartState extends OnlineStates {}

class GetCartState extends OnlineStates {}
class DeleteCartDataState extends OnlineStates {}

class ErrorCartState extends OnlineStates {}
