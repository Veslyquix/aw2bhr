	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801311C
sub_0801311C: @ 0x0801311C
	adds r0, #0x68
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08013150
	ldr r2, _08013154 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08013158 @ =gUnknown_03002020
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0801315C @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r0, _08013160 @ =gUnknown_03001FFC
	strh r1, [r0]
	ldrh r1, [r2]
	ldr r0, _08013164 @ =0x0000FFE0
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r2]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_08013150:
	bx lr
	.align 2, 0
_08013154: .4byte gUnknown_030030E0
_08013158: .4byte gUnknown_03002020
_0801315C: .4byte gUnknown_03002B28
_08013160: .4byte gUnknown_03001FFC
_08013164: .4byte 0x0000FFE0

