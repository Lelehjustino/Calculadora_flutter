class Memory {
static const operations = const ['%', '/', 'x', '-', '+', '='];

final _buffer = [0.0, 0.0];
int _bufferIndex = 0; 
String operation; 

String _value = '0';

void applyCommand(String command){
  if(command == 'AC'){
    _allClear();
  } else{
    _value += command; 
  }
}

_allClear(){
  _value = '0';
}

String get value{
  return _value; 
}

}