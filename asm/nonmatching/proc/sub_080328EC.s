	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080328EC
sub_080328EC: @ 0x080328EC
	push {r4, r5, lr}
	sub sp, #8
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r5, _08032944 @ =gUnknown_0849B060
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	bl sub_0803CD2C
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0803293C
	ldr r4, _08032948 @ =gUnknown_0849957C
	ldr r0, [r4]
	movs r1, #0x14
	str r1, [sp]
	str r2, [sp, #4]
	movs r1, #0
	movs r2, #0
	movs r3, #0x20
	bl sub_08012BC8
	ldr r0, [r5]
	ldrb r1, [r0, #9]
	ldr r0, _0803294C @ =gUnknown_0849B018
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	beq _08032938
	ldr r0, [r4]
	movs r1, #0x83
	lsls r1, r1, #1
	adds r0, r0, r1
	bl sub_080328C0
_08032938:
	bl sub_08013AFC
_0803293C:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032944: .4byte gUnknown_0849B060
_08032948: .4byte gUnknown_0849957C
_0803294C: .4byte gUnknown_0849B018

