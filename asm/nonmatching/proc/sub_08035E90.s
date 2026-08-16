	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035E90
sub_08035E90: @ 0x08035E90
	push {r4, r5, lr}
	mov ip, r0
	movs r4, #0
	movs r5, #0
	ldr r2, _08035ECC @ =gUnknown_08090EB0
	ldr r1, [r2]
	adds r0, #0x36
	ldrb r3, [r0]
	lsls r0, r3, #3
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0, #0x1e]
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _08035EBC
	mov r0, ip
	adds r0, #0x39
	ldrb r0, [r0]
	movs r4, #1
	ands r4, r0
_08035EBC:
	cmp r3, #2
	beq _08035ED6
	cmp r3, #2
	bgt _08035ED0
	cmp r3, #1
	beq _08035ED8
	b _08035F44
	.align 2, 0
_08035ECC: .4byte gUnknown_08090EB0
_08035ED0:
	cmp r3, #0x18
	beq _08035F0A
	b _08035F44
_08035ED6:
	movs r5, #2
_08035ED8:
	ldr r2, [r2]
	mov r0, ip
	adds r0, #0x36
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x1a]
	cmp r0, #0
	beq _08035F62
	mov r0, ip
	bl sub_08035D0C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _08035F62
	adds r0, r0, r4
	adds r0, r0, r5
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0803B48C
	b _08035F62
_08035F0A:
	mov r1, ip
	ldr r0, [r1, #0x30]
	cmp r0, #0
	beq _08035F24
	ldrb r1, [r0, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08035F24
	movs r0, #0x38
	bl sub_0803B48C
	b _08035F62
_08035F24:
	ldr r2, [r2]
	mov r0, ip
	adds r0, #0x36
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrh r0, [r2, #0x1a]
	cmp r0, #0
	beq _08035F62
	movs r1, #0x1a
	ldrsh r0, [r2, r1]
	bl sub_0803B48C
	b _08035F62
_08035F44:
	ldr r2, [r2]
	mov r0, ip
	adds r0, #0x36
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrh r0, [r2, #0x1a]
	cmp r0, #0
	beq _08035F62
	movs r1, #0x1a
	ldrsh r0, [r2, r1]
	bl sub_0803B48C
_08035F62:
	pop {r4, r5}
	pop {r0}
	bx r0

