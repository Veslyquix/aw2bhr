	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08059760
sub_08059760: @ 0x08059760
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r0, _080597B4 @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r1, _080597B8 @ =0x00002D5A
	adds r0, r0, r1
	bl sub_0801F92C
	ldr r4, _080597BC @ =gUnknown_030013EC
	ldr r6, _080597C0 @ =gUnknown_030040D8
	ldr r2, [r6]
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	ldrb r2, [r2]
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [sp]
	ldr r4, [r4]
	movs r3, #0x78
	bl _call_via_r4
	movs r0, #0x79
	bl sub_0801FD9C
	ldr r1, _080597C4 @ =0xFFFF0000
	ldr r0, [sp, #4]
	ands r0, r1
	ldr r4, _080597C8 @ =0x0000270F
	orrs r0, r4
	str r0, [sp, #4]
	movs r0, #0
	add r1, sp, #4
	bl sub_0805A9AC
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, r4
	beq _080597CC
	add r0, sp, #4
	bl sub_080591E4
	b _08059810
	.align 2, 0
_080597B4: .4byte gUnknown_08499590
_080597B8: .4byte 0x00002D5A
_080597BC: .4byte gUnknown_030013EC
_080597C0: .4byte gUnknown_030040D8
_080597C4: .4byte 0xFFFF0000
_080597C8: .4byte 0x0000270F
_080597CC:
	ldr r5, _0805981C @ =gUnknown_03004784
	ldr r4, [r5]
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	movs r1, #0x64
	bl __umodsi3
	ldrb r1, [r4, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bls _080597E8
	bl sub_0805F914
_080597E8:
	ldr r4, [r5]
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	movs r1, #0x64
	bl __umodsi3
	ldrb r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bhi _0805980C
	ldr r0, _08059820 @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_0804415C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08059810
_0805980C:
	bl sub_0805E718
_08059810:
	bl sub_0805F7B8
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805981C: .4byte gUnknown_03004784
_08059820: .4byte gUnknown_030033EC

