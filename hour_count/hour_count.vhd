library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity hour_count is
	port(
	clr:in std_logic;
	Cout2:in std_logic;
	Cout3:out std_logic;
	h,l:out std_logic_vector(3 downto 0)
	);
end hour_count;

architecture art of hour_count is
begin
process(cout2,clr)
variable cnt1,cnt0:std_logic_vector(3 downto 0);
begin
if(clr='1')then
	cnt1:="0000";
	cnt0:="0000";
else 
	if(cout2='1')then 
		if(cnt1="0010" and cnt0="0011") then
		cnt1:="0000";
		cnt0:="0000";
		elsif(cnt0<"1001")then 
		cnt0:=cnt0+1;
		else 
		cnt0:="0000";
		cnt1:=cnt1+1;
		end if;
	end if;
end if;
h<=cnt1;
l<=cnt0;
cout3<=cout2;	
end process;
end art;