// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {BUSD} from "../src/BUSD.sol";
import {CCNFT} from "../src/CCNFT.sol";

// Definición del contrato de prueba CCNFTTest que hereda de Test. 
// Declaración de direcciones y dos instancias de contratos (BUSD y CCNFT).
contract CCNFTTest is Test {
    address deployer;
    address c1;
    address c2;
    address funds;
    address fees;
    BUSD busd;
    CCNFT ccnft;

    // Ejecución antes de cada prueba. 
    // Inicializar las direcciones y desplegar las instancias de BUSD y CCNFT.
    function setUp() public {
        deployer = address(this);
        c1 = makeAddr("c1");
        c2 = makeAddr("c2");
        funds = makeAddr("funds");
        fees = makeAddr("fees");

        busd = new BUSD();
        ccnft = new CCNFT();

        // Configuraciones iniciales básicas si son requeridas
        ccnft.setFundsCollector(funds);
        ccnft.setFeesCollector(fees);
        ccnft.setFundsToken(address(busd));
    }

    // Prueba de "setFundsCollector" del contrato CCNFT. 
    // Llamar al método y despues verificar que el valor se haya establecido correctamente.
    function testSetFundsCollector() public {
        address newCollector = makeAddr("newCollector");
        ccnft.setFundsCollector(newCollector);
        assertEq(ccnft.fundsCollector(), newCollector);
    }

    // Prueba de "setFeesCollector" del contrato CCNFT
    // Verificar que el valor se haya establecido correctamente.
    function testSetFeesCollector() public {
        address newFeesCollector = makeAddr("newFeesCollector");
        ccnft.setFeesCollector(newFeesCollector);
        assertEq(ccnft.feesCollector(), newFeesCollector);
    }

    // Prueba de "setProfitToPay" del contrato CCNFT
    // Verificar que el valor se haya establecido correctamente.
    function testSetProfitToPay() public {
        uint256 newProfit = 500; // 5% por ejemplo
        ccnft.setProfitToPay(newProfit);
        assertEq(ccnft.profitToPay(), newProfit);
    }

    // Prueba de "setCanBuy" primero estableciéndolo en true y verificando que se establezca correctamente.
    // Despues establecerlo en false verificando nuevamente.
    function testSetCanBuy() public {
        ccnft.setCanBuy(true);
        assertTrue(ccnft.canBuy());

        ccnft.setCanBuy(false);
        assertFalse(ccnft.canBuy());
    }

    // Prueba de método "setCanTrade". Similar a "testSetCanBuy".
    function testSetCanTrade() public {
        ccnft.setCanTrade(true);
        assertTrue(ccnft.canTrade());

        ccnft.setCanTrade(false);
        assertFalse(ccnft.canTrade());
    }

    // Prueba de método "setCanClaim". Similar a "testSetCanBuy".
    function testSetCanClaim() public {
        ccnft.setCanClaim(true);
        assertTrue(ccnft.canClaim());

        ccnft.setCanClaim(false);
        assertFalse(ccnft.canClaim());
    }

    // Prueba de "setMaxValueToRaise" con diferentes valores.
    // Verifica que se establezcan correctamente.
    function testSetMaxValueToRaise() public {
        uint256 maxVal = 1000000 ether;
        ccnft.setMaxValueToRaise(maxVal);
        assertEq(ccnft.maxValueToRaise(), maxVal);
    }

    // Prueba de "addValidValues" añadiendo diferentes valores.
    // Verificar que se hayan añadido correctamente.
    function testAddValidValues() public {
        uint256 val = 100 ether;
        ccnft.addValidValues(val);
        assertTrue(ccnft.validValues(val));
    }

    // Prueba de "setMaxBatchCount".
    // Verifica que el valor se haya establecido correctamente.
    function testSetMaxBatchCount() public {
        uint16 batch = 10;
        ccnft.setMaxBatchCount(batch);
        assertEq(ccnft.maxBatchCount(), batch);
    }

    // Prueba de "setBuyFee".
    // Verificar que el valor se haya establecido correctamente.
    function testSetBuyFee() public {
        uint16 fee = 150; // 1.5%
        ccnft.setBuyFee(fee);
        assertEq(ccnft.buyFee(), fee);
    }

    // Prueba de "setTradeFee".
    // Verificar que el valor se haya establecido correctamente.
    function testSetTradeFee() public {
        uint16 fee = 200; // 2%
        ccnft.setTradeFee(fee);
        assertEq(ccnft.tradeFee(), fee);
    }

    // Prueba de que no se pueda comerciar cuando canTrade es false.
    // Verificar que se lance un error esperado.
    function testCannotTradeWhenCanTradeIsFalse() public {
        ccnft.setCanTrade(false);
        
        vm.prank(c1);
        vm.expectRevert(); // O el mensaje de error específico configurado en el contrato
        ccnft.trade(1);
    }

    // Prueba que no se pueda comerciar con un token que no existe, incluso si canTrade es true. 
    // Verificar que se lance un error esperado.
    function testCannotTradeWhenTokenDoesNotExist() public {
        ccnft.setCanTrade(true);

        vm.prank(c1);
        vm.expectRevert(); // El token 999 no existe
        ccnft.trade(999);
    }
}