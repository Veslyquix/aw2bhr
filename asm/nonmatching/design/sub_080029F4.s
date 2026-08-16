	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080029F4
sub_080029F4: @ 0x080029F4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	ldr r0, [sp, #0x18]
	ldr r1, _08002A1C @ =gUnknown_02028E40
	ldrb r2, [r1]
	movs r1, #0x3f
	ands r3, r1
	cmp r0, #0
	beq _08002A68
	cmp r6, #0
	bne _08002A3C
	cmp r3, #0x19
	beq _08002A20
	adds r0, r3, #0
	bl sub_0802A838
	b _08002A28
	.align 2, 0
_08002A1C: .4byte gUnknown_02028E40
_08002A20:
	ldr r1, _08002A34 @ =gUnknown_08489190
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
_08002A28:
	ldr r1, _08002A38 @ =0x06014BC0
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_08011E54
	b _08002A68
	.align 2, 0
_08002A34: .4byte gUnknown_08489190
_08002A38: .4byte 0x06014BC0
_08002A3C:
	cmp r3, #0x19
	beq _08002A48
	adds r0, r3, #0
	bl sub_0802A838
	b _08002A50
_08002A48:
	ldr r1, _08002AA0 @ =gUnknown_08489190
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
_08002A50:
	subs r1, r6, #1
	lsls r1, r1, #3
	movs r2, #0xa3
	lsls r2, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #5
	ldr r2, _08002AA4 @ =0x06010000
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_08011E54
_08002A68:
	subs r5, r4, #4
	ldr r0, _08002AA8 @ =0x000001FF
	ands r5, r0
	movs r4, #0xff
	ands r4, r7
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _08002A84
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r4, r0
_08002A84:
	ldr r1, _08002AAC @ =gUnknown_08485D68
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0801BD00
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002AA0: .4byte gUnknown_08489190
_08002AA4: .4byte 0x06010000
_08002AA8: .4byte 0x000001FF
_08002AAC: .4byte gUnknown_08485D68

