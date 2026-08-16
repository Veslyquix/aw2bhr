	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063B50
sub_08063B50: @ 0x08063B50
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08063B6A
	subs r0, r2, #1
	strh r0, [r1]
	b _08063BB0
_08063B6A:
	adds r2, r4, #0
	adds r2, #0x44
	ldrh r1, [r2]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _08063B9C
	subs r0, r1, #1
	strh r0, [r2]
	ldr r1, [r4, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _08063B88
	adds r0, #3
_08063B88:
	asrs r0, r0, #2
	str r0, [r4, #0x2c]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0xa
	bne _08063B9C
	ldr r1, _08063BB8 @ =gUnknown_0202F0E8
	ldrh r0, [r1, #4]
	subs r0, #1
	strh r0, [r1, #4]
_08063B9C:
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #0x2c]
	adds r3, r4, #0
	adds r3, #0x48
	ldrb r3, [r3]
	ldrh r4, [r4, #0x1c]
	str r4, [sp]
	bl sub_08063CCC
_08063BB0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063BB8: .4byte gUnknown_0202F0E8

