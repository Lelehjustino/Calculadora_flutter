class Memory {
static const operations = const ['%', '/', 'x', '-', '+', '='];

final _buffer = [0.0, 0.0];
int _bufferIndex = 0; 
late String operation; 
String _value = '0';
bool _wipeValue = false; 

void applyCommand(String command){
  if(command == 'AC'){
    _allClear();
  } else if(operations.contains(command)){
     _setOperation(command);
  }
  else{
    _addDigt(command);
  }
}

void _setOperation(String newOperation) {
  if (_bufferIndex == 0) {
    operation = newOperation; // <-- Corrected
    _bufferIndex = 1;
  } else {
    _buffer[0] = __calculate();
    _buffer[1] = 0.0;
    _value = _buffer[0].toString();
    _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;
  }

  _wipeValue = true;
}

/*_setOperation(String newOperation){
  if(_bufferIndex == 0){
   operation = newOperation;  //
    _bufferIndex = 1;
  } else{
    _buffer[0] = __calculate(); 
    _buffer[1] = 0.0; 
    _value = _buffer[0].toString();
    _value = _value.endsWith('.0') ? _value.split('.')[0] : _value; 
  }
  _wipeValue = true; 
}*/

_addDigt(String digit){
  final isDot = digit == ',';
  final wipeValue = (_value == '0' && !isDot) || _wipeValue; 

  if(isDot && _value.contains('.') && !wipeValue){
    return; 
  }

  final emptyValue = isDot ? '0' : '';
  final currentValue =  wipeValue ? '' : _value; 
  _value = currentValue + digit; 
  _wipeValue = false;  

  _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  
}

_allClear(){
  _value = '0';
}


__calculate(){
  switch(operation ){
    case '%' : return _buffer[0] % _buffer[1];
    case '/' : return _buffer[0] / _buffer[1];
    case 'x' : return _buffer[0] * _buffer[1];
    case '-' : return _buffer[0] - _buffer[1];
    case '+' : return _buffer[0] + _buffer[1];

    default: return _buffer[0];
  }
}

String get value{
  return _value; 
}

}