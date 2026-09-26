// Decompile one named function in a Ghidra headless project.
// @category AW2BHR

import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.Function;

public class DecompileNamedFunction extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length != 1) {
            printerr("usage: DecompileNamedFunction.java <function-name>");
            return;
        }

        Function target = null;
        for (Function function : currentProgram.getFunctionManager().getFunctions(true)) {
            if (args[0].equals(function.getName())) {
                target = function;
                break;
            }
        }
        if (target == null) {
            printerr("function not found: " + args[0]);
            return;
        }

        DecompInterface decompiler = new DecompInterface();
        try {
            if (!decompiler.openProgram(currentProgram)) {
                printerr("could not open decompiler for " + target.getName());
                return;
            }
            DecompileResults result = decompiler.decompileFunction(target, 60, monitor);
            if (!result.decompileCompleted() || result.getDecompiledFunction() == null) {
                printerr("decompilation failed: " + result.getErrorMessage());
                return;
            }
            println(result.getDecompiledFunction().getC());
        } finally {
            decompiler.dispose();
        }
    }
}
