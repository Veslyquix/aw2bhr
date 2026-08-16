	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08059824
sub_08059824: @ 0x08059824
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _08059878 @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r1, _0805987C @ =0x00002D5A
	adds r0, r0, r1
	bl sub_0801F92C
	ldr r4, _08059880 @ =gUnknown_030013EC
	ldr r5, _08059884 @ =gUnknown_030040D8
	ldr r2, [r5]
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	ldrb r2, [r2]
	movs r3, #0
	str r3, [sp]
	ldr r4, [r4]
	movs r3, #0x78
	bl _call_via_r4
	movs r0, #0x79
	bl sub_0801FD9C
	ldr r1, _08059888 @ =0xFFFF0000
	ldr r0, [sp, #4]
	ands r0, r1
	ldr r4, _0805988C @ =0x0000270F
	orrs r0, r4
	str r0, [sp, #4]
	movs r0, #1
	add r1, sp, #4
	bl sub_0805A9AC
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, r4
	beq _08059890
	add r0, sp, #4
	bl sub_080591E4
	b _080598AC
	.align 2, 0
_08059878: .4byte gUnknown_08499590
_0805987C: .4byte 0x00002D5A
_08059880: .4byte gUnknown_030013EC
_08059884: .4byte gUnknown_030040D8
_08059888: .4byte 0xFFFF0000
_0805988C: .4byte 0x0000270F
_08059890:
	ldr r0, _080598B8 @ =gUnknown_03004784
	ldr r4, [r0]
	ldr r0, [r5]
	ldrb r0, [r0, #0xa]
	movs r1, #0x64
	bl __umodsi3
	ldrb r1, [r4, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bls _080598AC
	bl sub_0805F914
_080598AC:
	bl sub_0805EB58
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080598B8: .4byte gUnknown_03004784

