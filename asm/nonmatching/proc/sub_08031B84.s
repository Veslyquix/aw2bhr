	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031B84
sub_08031B84: @ 0x08031B84
	push {r4, lr}
	ldr r4, _08031BB4 @ =gUnknown_0849B01C
	ldr r1, [r4]
	ldrh r0, [r1, #6]
	ldr r0, _08031BB8 @ =0x00009ABC
	strh r0, [r1, #6]
	ldr r0, _08031BBC @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08031BA4
	movs r0, #0x68
	bl sub_0803B4DC
_08031BA4:
	ldr r0, [r4]
	ldr r1, _08031BC0 @ =0x00000212
	adds r2, r0, r1
	ldrh r0, [r2]
	cmp r0, #0
	bne _08031BC4
	movs r0, #1
	b _08031BD2
	.align 2, 0
_08031BB4: .4byte gUnknown_0849B01C
_08031BB8: .4byte 0x00009ABC
_08031BBC: .4byte gpKeySt
_08031BC0: .4byte 0x00000212
_08031BC4:
	ldr r1, _08031BD8 @ =gUnknown_0300410C
	ldr r0, _08031BDC @ =gUnknown_030040CC
	ldrh r0, [r0]
	strh r0, [r1]
	ldrh r0, [r2]
	movs r0, #0
	strh r0, [r2]
_08031BD2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08031BD8: .4byte gUnknown_0300410C
_08031BDC: .4byte gUnknown_030040CC

