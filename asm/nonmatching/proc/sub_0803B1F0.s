	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B1F0
sub_0803B1F0: @ 0x0803B1F0
	push {r4, lr}
	ldr r4, _0803B22C @ =gUnknown_080910E8
	ldr r0, _0803B230 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #3
	bl __udivsi3
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #0x6c
	ldr r2, _0803B234 @ =gUnknown_0849E6B8
	ldr r3, _0803B238 @ =0x00005054
	movs r0, #0x38
	bl sub_0801BD00
	ldr r2, _0803B23C @ =gUnknown_0849E6A4
	movs r3, #0x80
	lsls r3, r3, #6
	movs r0, #0x48
	movs r1, #0x88
	bl sub_0801BD00
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803B22C: .4byte gUnknown_080910E8
_0803B230: .4byte gUnknown_03004008
_0803B234: .4byte gUnknown_0849E6B8
_0803B238: .4byte 0x00005054
_0803B23C: .4byte gUnknown_0849E6A4

