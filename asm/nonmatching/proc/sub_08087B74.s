	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087B74
sub_08087B74: @ 0x08087B74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, _08087BFC @ =gUnknown_02027F74
	adds r0, #4
	adds r6, r5, r0
	ldrb r0, [r6]
	bl sub_0802490C
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08087C00 @ =gUnknown_08616D94
	bl Proc_Find
	cmp r0, #0
	beq _08087BF0
	str r5, [r0, #0x54]
	movs r5, #0
	subs r7, r4, #1
	cmp r5, r7
	bge _08087BF0
	ldr r0, _08087C04 @ =gUnknown_085C77DC
	mov sb, r0
	movs r2, #0x90
	mov r8, r2
_08087BAA:
	ldrb r1, [r6]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, #1
	adds r0, r5, r0
	add r0, sb
	ldrb r0, [r0]
	ldr r1, _08087C08 @ =0x000003FF
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _08087C0C @ =0x06010000
	adds r1, r1, r2
	adds r4, r5, #0
	adds r4, #0x17
	adds r2, r4, #0
	bl sub_08043FA8
	ldrb r0, [r6]
	bl sub_0803CA54
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08087BE6
	lsls r1, r4, #0x15
	lsrs r1, r1, #0x10
	ldr r0, _08087C10 @ =gUnknown_08614238
	movs r2, #0x20
	bl sub_08013618
_08087BE6:
	movs r0, #0xc
	add r8, r0
	adds r5, #1
	cmp r5, r7
	blt _08087BAA
_08087BF0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087BFC: .4byte gUnknown_02027F74
_08087C00: .4byte gUnknown_08616D94
_08087C04: .4byte gUnknown_085C77DC
_08087C08: .4byte 0x000003FF
_08087C0C: .4byte 0x06010000
_08087C10: .4byte gUnknown_08614238

