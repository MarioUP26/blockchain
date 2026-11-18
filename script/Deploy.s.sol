// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {BUSD} from "../src/BUSD.sol";
import {CCNFT} from "../src/CCNFT.sol";

contract DeployScript is Script {
    function run() external {
        // Inicia la transmisión de la transacción usando la clave privada configurada en el entorno
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // 1. Desplegar el contrato BUSD (Token de pago)
        BUSD busd = new BUSD();
        console.log("BUSD desplegado en:", address(busd));

        // 2. Desplegar el contrato CCNFT (NFTs agrícolas de CryptoCampo)
        CCNFT ccnft = new CCNFT();
        console.log("CCNFT desplegado en:", address(ccnft));

        // 3. Configuraciones iniciales recomendadas (puedes ajustarlas según tus direcciones)
        // Por ejemplo, asignar el token BUSD, y definir las direcciones colectoras
        ccnft.setFundsToken(address(busd));
        
        // Opcional: configurar colector de fondos y comisiones a la misma dirección del deployer para pruebas
        address deployerAddress = vm.addr(deployerPrivateKey);
        ccnft.setFundsCollector(deployerAddress);
        ccnft.setFeesCollector(deployerAddress);

        vm.stopBroadcast();
    }
}