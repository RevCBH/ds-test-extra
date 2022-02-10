// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "ds-test/test.sol";
import {Hevm} from "./Hevm.sol";

contract DSTestExtra is DSTest {
    Hevm internal vm = Hevm(HEVM_ADDRESS);

    function assertValidAddress(address a) internal {
        if (a == address(0x0)) {
            emit log("Error: address is zero address");
            fail();
        }
    }

    function assertZero(uint256 a) internal {
        if (a != 0) {
            emit log("Error: expected zero value");
            fail();
        }
    }

    function assertZero(uint256 a, string memory err) internal {
        if (a != 0) {
            emit log_named_string("Error: expected zero value", err);
            fail();
        }
    }

    function assertZero(int256 a) internal {
        if (a != 0) {
            emit log("Error: expected zero value");
            fail();
        }
    }

    function assertZero(int256 a, string memory err) internal {
        if (a != 0) {
            emit log_named_string("Error: expected zero value", err);
            fail();
        }
    }

    function assertFalse(bool condition) internal {
        if (condition) {
            emit log("Error: Assertion should be false");
            fail();
        }
    }

    function assertFalse(bool condition, string memory err) internal {
        if (condition) {
            emit log_named_string("Error", err);
            assertFalse(condition);
        }
    }

    function mockAndExpectCall(
        address _to,
        bytes memory _args,
        bytes memory _returns
    ) internal {
        vm.mockCall(_to, _args, _returns);
        vm.expectCall(_to, _args);
    }
}
