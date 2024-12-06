import ballerina/io;

//Ballerina provides support for interacting with a transaction manager.
//Compile-time guarantees that transactions are bracketed with begin and commit or rollback.
//Documentation: https://ballerina.io/learn/by-example/transaction-statement/ 
public function main() returns error? {
    // The transaction statement begins a new transaction and executes a block.
    transaction {
        doStage1();
        doStage2();

        // Commit of a transaction must be done explicitly using commit.
        // A commit must be lexically within a transaction statement and may return an error;
        check commit;

    }
    return;
}

function doStage1() {
    io:println("Stage1 completed");
}

function doStage2() {
    io:println("Stage2 completed");
}