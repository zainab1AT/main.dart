import 'dart:io';

void main(){
  
  TicTacToe c=TicTacToe();
  c.generatBoard();
  c.get_char();
  
}


class TicTacToe {
  
    bool isplayerX=true;
    int moveCount=0;
  
 List<String> board=['1','2','3','4','5','6','7','8','9'];
 List<String> situations=['012','345','678','036','147','258','048','246'];
 bool win=false;
  
  
  
  void winner(player){
    for(final e in situations){
      bool c=check(e,player);
      if(c==true){
        print('$player WON...');
        win=true;
        break;
      }
    }
  }
  
  
  
  bool check(String situation,String one){
    
     bool match=false;

    List<int> numbers=situation.split('').map((e){return int.parse(e);}).toList();
    
    
    for(final r in numbers){
      if(board[r]==one){
        match=true;
      }
      else{ match=false;
        break;
      }
    }
    
    return match;
  }
  
  
  void get_char(){
    print('Choose number for ${isplayerX==true ? "X":"O"}');
    int num=int.parse(stdin.readLineSync()!);
    board[num-1]=isplayerX==true?'X':'O';
    isplayerX=!isplayerX;
    moveCount++;
    
    if(moveCount==9){
      win=true;
      print('DRAW...');
      
    }
    else{
      generatBoard();
    
    }
    
    winner('X');
    winner('O');
    if(win==false) get_char();
      
  }
  
  
  void generatBoard(){
    
    print(' ${board[0]} | ${board[1]} | ${board[2]} ');
    print('---+---+---');
    print(' ${board[3]} | ${board[4]} | ${board[5]} ');
    print('---+---+---');
    print(' ${board[6]} | ${board[7]} | ${board[8]} ');
  
  }
  
}
