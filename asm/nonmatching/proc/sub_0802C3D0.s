	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C3D0
sub_0802C3D0: @ 0x0802C3D0
	push {lr}
	bl sub_08023824
	bl sub_08023518
	movs r0, #8
	bl sub_08023908
	ldr r0, _0802C41C @ =gUnknown_08499590
	ldr r0, [r0]
	ldrh r1, [r0, #0x10]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0802C416
	ldr r0, _0802C420 @ =gUnknown_030033E0
	ldr r0, [r0]
	ldr r1, _0802C424 @ =0x00070007
	ands r0, r1
	cmp r0, #0
	bne _0802C416
	ldr r0, _0802C428 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0802C416
	movs r0, #0x66
	bl sub_0803B4DC
	ldr r0, _0802C42C @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_0802C416:
	pop {r0}
	bx r0
	.align 2, 0
_0802C41C: .4byte gUnknown_08499590
_0802C420: .4byte gUnknown_030033E0
_0802C424: .4byte 0x00070007
_0802C428: .4byte gpKeySt
_0802C42C: .4byte gUnknown_03001FBC

