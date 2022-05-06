library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Contador_H is
   port(
      RST : in  std_logic;                    -- Reset maestro
      CLK : in  std_logic;                    -- Reloj maestro
      HIC : in  std_logic;                    -- Habilitacion de entrada
      HAD : out std_logic_vector(9 downto 0); -- Direccion horizontal
      EC  : out std_logic                     -- Fin de cuenta
      );
   end Contador_H;

architecture Cascada of Contador_H is

-- Estados internos
signal Qp, Qn : std_logic_vector(9 downto 0);

-- Detector de 639
signal Z      : std_logic;

-- Incrementador
signal I      : std_logic_vector(9 downto 0);

-- Anulador
signal A      : std_logic_vector(9 downto 0);

begin

   Detector: process(Qp)
   begin
      if (Qp="1001111111") then
         Z <= '0';
      else
         Z <= '1';
      end if;
   end process Detector;

   Incrementador: process(Qp)
   begin
      I   <= Qp + 1;
      HAD <= Qp;
   end process Incrementador;

   Anulador: process(Z,I,HIC)
   begin
      for j in 0 to 9 loop
         A(j) <= Z AND I(j);
      end loop;
      EC <= NOT(Z) AND HIC;
   end process Anulador;

   Habilitacion: process(Qp,HIC,A)
   begin
      if (HIC='1') then
         Qn <= A;
      else
         Qn <= Qp;
      end if;
   end process Habilitacion;
   
   Secuencial: process(RST,CLK)
   begin
      if (RST='0') then
         Qp <= (others => '0');
      elsif (CLK'event and CLK='1') then 
         Qp <= Qn;
      end if;
   end process Secuencial;

end Cascada;