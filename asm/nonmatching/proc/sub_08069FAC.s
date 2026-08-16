	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08069FAC
sub_08069FAC: @ 0x08069FAC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	ldr r0, _08069FCC @ =gUnknown_08581480
	bl Proc_Start
	str r4, [r0, #0x34]
	str r6, [r0, #0x38]
	str r5, [r0, #0x3c]
	movs r1, #0
	str r1, [r0, #0x40]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08069FCC: .4byte gUnknown_08581480

