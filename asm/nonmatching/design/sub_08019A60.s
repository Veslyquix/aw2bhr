	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019A60
sub_08019A60: @ 0x08019A60
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _08019A94 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08019A98
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r5, [r0]
	subs r0, #0x11
	adds r0, r0, r5
	ldrb r3, [r0]
	ldr r1, [r6, #0x20]
	lsls r0, r3, #5
	adds r0, r0, r1
	ldr r4, [r0, #0x10]
	cmp r4, #0
	beq _08019B44
	adds r0, r6, #0
	adds r0, #0x24
	adds r0, r0, r3
	b _08019AFC
	.align 2, 0
_08019A94: .4byte gpKeySt
_08019A98:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08019B08
	adds r5, r6, #0
	adds r5, #0x42
	ldrb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x31
	adds r0, r4, r0
	ldrb r0, [r0]
	ldr r1, [r6, #0x20]
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	bl sub_08074410
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08019B44
	ldrb r0, [r5]
	adds r0, r4, r0
	ldrb r0, [r0]
	adds r2, r6, #0
	adds r2, #0x24
	adds r0, r2, r0
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _08019AE2
	movs r0, #0x68
	bl sub_0803B4DC
	b _08019AE8
_08019AE2:
	movs r0, #0x65
	bl sub_0803B4DC
_08019AE8:
	ldrb r5, [r5]
	adds r0, r4, r5
	ldrb r3, [r0]
	ldr r1, [r6, #0x20]
	lsls r0, r3, #5
	adds r0, r0, r1
	ldr r4, [r0, #0x14]
	cmp r4, #0
	beq _08019B44
	adds r0, r7, r3
_08019AFC:
	ldrb r2, [r0]
	adds r0, r3, #0
	adds r1, r5, #0
	bl _call_via_r4
	b _08019B44
_08019B08:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08019B44
	ldr r0, _08019B4C @ =gUnknown_08489568
	bl sub_0801537C
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r5, [r0]
	subs r0, #0x11
	adds r0, r0, r5
	ldrb r3, [r0]
	ldr r1, [r6, #0x20]
	lsls r0, r3, #5
	adds r0, r0, r1
	ldr r4, [r0, #0x18]
	cmp r4, #0
	beq _08019B3E
	adds r0, r6, #0
	adds r0, #0x24
	adds r0, r0, r3
	ldrb r2, [r0]
	adds r0, r3, #0
	adds r1, r5, #0
	bl _call_via_r4
_08019B3E:
	movs r0, #0x66
	bl sub_0803B4DC
_08019B44:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019B4C: .4byte gUnknown_08489568

