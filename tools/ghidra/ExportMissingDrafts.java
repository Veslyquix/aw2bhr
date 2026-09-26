// Export Ghidra pseudocode for explicitly named functions without changing C drafts.
// @category AW2BHR

import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.Function;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;

public class ExportMissingDrafts extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length < 2) {
            throw new IllegalArgumentException("usage: ExportMissingDrafts.java <work-directory> <function>...");
        }
        Path work = Path.of(args[0]).toAbsolutePath().normalize();
        Map<String, Function> functions = new HashMap<>();
        for (Function function : currentProgram.getFunctionManager().getFunctions(true)) {
            functions.put(function.getName(), function);
        }
        int exported = 0;
        int skipped = 0;
        DecompInterface decompiler = new DecompInterface();
        try {
            if (!decompiler.openProgram(currentProgram)) {
                throw new IllegalStateException("could not open Ghidra decompiler");
            }
            for (int i = 1; i < args.length; i++) {
                String name = args[i];
                if (!name.matches("sub_[0-9A-Fa-f]{8}")) {
                    printerr("invalid function name: " + name);
                    skipped++;
                    continue;
                }
                Function function = functions.get(name);
                if (function == null) {
                    printerr("function not found: " + name);
                    skipped++;
                    continue;
                }
                Path dir = work.resolve(name);
                if (Files.exists(dir.resolve(name + ".c"))) {
                    println("existing C draft, skipped: " + name);
                    skipped++;
                    continue;
                }
                DecompileResults result = decompiler.decompileFunction(function, 90, monitor);
                if (!result.decompileCompleted() || result.getDecompiledFunction() == null) {
                    printerr("decompilation failed: " + name + ": " + result.getErrorMessage());
                    skipped++;
                    continue;
                }
                Files.createDirectories(dir);
                Path output = dir.resolve("ghidra.txt");
                String source = "Ghidra reference only; not a compile-ready C draft.\n"
                    + "Function: " + name + " at " + function.getEntryPoint() + "\n\n"
                    + result.getDecompiledFunction().getC();
                Files.writeString(output, source, StandardCharsets.UTF_8);
                println("exported: " + name);
                exported++;
            }
        } finally {
            decompiler.dispose();
        }
        println("ExportMissingDrafts: exported=" + exported + " skipped=" + skipped);
    }
}
