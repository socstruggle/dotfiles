--------------------------------------------------------------------------------------
-- CHAR LIBRARY START
--------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

package Char_Lib is
  function To_Upper(C_In: character) return character;
  function Is_Hex(C_In: character) return boolean;
  function Hex_To_Slv(C_In: character) return std_logic_vector;
  function Sl_To_Char(Sl_In: std_logic) return character;
end Char_Lib;

package body Char_Lib is
  function To_Upper(C_In: character) return character is
  begin
    case C_In is
      when 'a' => 
        return 'A';
      when 'b' =>
        return 'B';
      when 'c' =>
        return 'C';
      when 'd' =>
        return 'D';
      when 'e' =>
        return 'E';
      when 'f' =>
        return 'F';
      when others =>
        return C_In;
    end case;
  end To_Upper;

  function Is_Hex(C_In: character) return boolean is
  begin
    case To_Upper(C_In) is
      when '0'|'1'|'2'|'3'|'4'|'5'|'6'|'7'|'8'|'9'|
           'A'|'B'|'C'|'D'|'E'|'F' =>
             return True;
      when others =>
        return False;
    end case;
  end Is_Hex;
  
  function Hex_To_Slv(C_In: character) return std_logic_vector is
  begin
    case To_Upper(C_In) is
      when '0' =>
        return "0000";
      when '1' =>
        return "0001";
      when '2' =>
        return "0010";
      when '3' =>
        return "0011";
      when '4' =>
        return "0100";
      when '5' =>
        return "0101";
      when '6' =>
        return "0110";
      when '7' =>
        return "0111";
      when '8' =>
        return "1000";
      when '9' =>
        return "1001";
      when 'A' =>
        return "1010";
      when 'B' =>
        return "1011";
      when 'C' =>
        return "1100";
      when 'D' =>
        return "1101";
      when 'E' =>
        return "1110";
      when 'F' =>
        return "1111";
      when others =>
        return "XXXX";
    end case;
  end Hex_To_Slv;

  function Sl_To_Char(Sl_In: std_logic) return character is
  begin
    case Sl_In is
      when '0' =>
        return '0';
      when '1' =>
        return '1';
      when 'Z' =>
        return 'Z';
      when others =>
        return 'X';
    end case;
  end Sl_To_Char;
 
end Char_Lib;
--------------------------------------------------------------------------------------
-- CHAR LIBRARY END
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
-- SLV LIBRARY START
--------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

use std.textio.all;
use work.Char_Lib.all;

package Slv_Lib is
  type Slv_Ptr is access std_logic_vector;
  
  procedure Read_Hex_Line(variable Line_In: in line; variable Slv_Ptr_Out: out Slv_Ptr);
  procedure To_Line(variable Slv_Ptr_In: in Slv_Ptr; variable Line_Out: out line);
end Slv_Lib;

package body Slv_lib is
  procedure Read_Hex_Line(variable Line_In: in line; variable Slv_Ptr_Out: out Slv_Ptr) is
    variable Tmp: Slv_Ptr;
  begin
    Tmp:=new std_logic_vector'("");
    for I in Line_In.all'range loop
      Tmp:=new std_logic_vector'(Tmp.all&Hex_To_Slv(Line_In.all(I)));
    end loop;
    Slv_Ptr_Out:=Tmp;
  end Read_Hex_Line;
  
  procedure To_Line(variable Slv_Ptr_In: in Slv_Ptr; variable Line_Out: out line) is
    variable Tmp: line;
  begin
    Tmp:=new string'("");
    for I in Slv_Ptr_In'range loop
      Tmp:=new string'(Tmp.all&Sl_To_Char(Slv_Ptr_In.all(I)));
    end loop;
    Line_Out:=Tmp;
  end To_Line;
end Slv_Lib;
--------------------------------------------------------------------------------------
-- SLV LIBRARY END
--------------------------------------------------------------------------------------
