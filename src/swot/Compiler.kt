package swot

import java.io.File

/**
 * @author max
 */

object CompilationState {
    val blacklist = File("lib/domains/blacklist.txt").readLines().toHashSet()
    val domains = File("lib/domains/tlds.txt").readLines().toHashSet()
}

fun main(args: Array<String>) {
    val root = File("lib/domains")
    root.walkTopDown().forEach {
        if (it.isFile) {
            val parts = it.toRelativeString(root).replace('\\', '/').removeSuffix(".txt").split('/').toList()
            if (!checkSet(CompilationState.blacklist, parts) && !checkSet(CompilationState.domains, parts)) {
                CompilationState.domains.add(parts.reversed().joinToString("."))
            }
        }
    }

    val blacklist = CompilationState.blacklist.map { "-$it" }.sorted().joinToString("\n")
    File("out/artifacts").mkdirs()
    File("out/artifacts/swot.txt").writeText(blacklist + "\n" + CompilationState.domains.sorted().joinToString("\n"))
}
