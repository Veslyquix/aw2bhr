	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004E44
sub_08004E44: @ 0x08004E44
	push {r4, lr}
	ldr r4, _08004E7C @ =gUnknown_0200B204
	movs r0, #0
	adds r1, r4, #0
	bl sub_0803CCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08004E80
	movs r0, #1
	adds r1, r4, #0
	bl sub_0803CCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08004E80
	movs r0, #2
	adds r1, r4, #0
	bl sub_0803CCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08004E80
	movs r0, #2
	b _08004E82
	.align 2, 0
_08004E7C: .4byte gUnknown_0200B204
_08004E80:
	movs r0, #0
_08004E82:
	pop {r4}
	pop {r1}
	bx r1

