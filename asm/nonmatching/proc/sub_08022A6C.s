	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08022A6C
sub_08022A6C: @ 0x08022A6C
	push {r4, r5, r6, lr}
	ldr r4, _08022AA4 @ =gUnknown_08101984
	ldr r6, _08022AA8 @ =gUnknown_03004008
	ldr r0, [r6]
	lsrs r0, r0, #2
	movs r5, #0xf
	ands r0, r5
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0x8a
	lsls r1, r1, #2
	movs r2, #2
	bl sub_0801368C
	ldr r0, [r6]
	lsrs r0, r0, #2
	ands r0, r5
	lsls r0, r0, #1
	adds r4, #0x20
	adds r0, r0, r4
	movs r1, #0x8e
	lsls r1, r1, #2
	movs r2, #2
	bl sub_0801368C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08022AA4: .4byte gUnknown_08101984
_08022AA8: .4byte gUnknown_03004008

