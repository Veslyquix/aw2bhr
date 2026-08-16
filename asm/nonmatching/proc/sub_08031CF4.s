	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031CF4
sub_08031CF4: @ 0x08031CF4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _08031D44 @ =gUnknown_08499578
	ldr r0, [r0]
	movs r1, #2
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #0xc
	movs r2, #8
	movs r3, #2
	bl sub_08012BC8
	bl sub_08013AEC
	movs r0, #0x1e
	ldrsh r5, [r4, r0]
	movs r0, #0x20
	ldrsh r6, [r4, r0]
	ldr r4, _08031D48 @ =gUnknown_0849B074
	ldr r0, _08031D4C @ =gUnknown_03004008
	ldr r0, [r0]
	lsrs r0, r0, #3
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	ldr r3, _08031D50 @ =0x00004054
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0801BD00
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031D44: .4byte gUnknown_08499578
_08031D48: .4byte gUnknown_0849B074
_08031D4C: .4byte gUnknown_03004008
_08031D50: .4byte 0x00004054

