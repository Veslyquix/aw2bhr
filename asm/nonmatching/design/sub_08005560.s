	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005560
sub_08005560: @ 0x08005560
	push {lr}
	ldr r0, _08005578 @ =gUnknown_0200B0B0
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #2]
	ldr r0, _0800557C @ =gUnknown_08488444
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_08005578: .4byte gUnknown_0200B0B0
_0800557C: .4byte gUnknown_08488444

