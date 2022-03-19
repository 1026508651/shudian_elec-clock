library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity min_count_6 is
 port(
  CLK:in std_logic;
  CLR: in std_logic;
  Lout: out std_logic_vector(3 downto 0);
  Cout1: out std_logic
 );
end min_count_6;

architecture art_6 of min_count_6 is
signal temp1:std_logic_vector(3 downto 0);
begin
 process(CLK,CLR)
 begin
  if(CLR='1')then
   temp1<="0000";
  elsif(CLK'event and CLK='1')then
   if(temp1="0101")then
    temp1<="0000";
    Cout1<='1';
   else
    temp1<=temp1+1;
    Cout1<='0';
   end if;
  end if;
 end process;
Lout<=temp1;
  
end art_6;