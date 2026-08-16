	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F6F0
sub_0801F6F0: @ 0x0801F6F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	ldr r0, _0801F818 @ =gUnknown_0300409C
	ldr r3, [r0]
	lsrs r1, r1, #0x18
	ldrb r0, [r3]
	adds r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsrs r2, r2, #0x18
	ldrb r1, [r3, #1]
	adds r2, r2, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov ip, r2
	ldr r6, _0801F81C @ =gUnknown_0809092C
	ldr r0, [r6]
	ldr r5, [r0]
	ldr r0, _0801F820 @ =gUnknown_08499590
	ldr r7, [r0]
	lsls r1, r2, #1
	ldr r2, _0801F824 @ =0x0000417A
	adds r0, r7, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	add r0, r8
	mov sb, r0
	ldr r1, _0801F828 @ =0x00001432
	adds r0, r7, r1
	add r0, sb
	ldrb r0, [r0]
	movs r2, #0x1f
	ands r2, r0
	adds r2, r5, r2
	ldr r0, _0801F82C @ =gUnknown_08090930
	mov sl, r0
	ldr r4, [r0]
	ldrb r0, [r3, #1]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r3]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	mov r2, ip
	lsls r0, r2, #2
	adds r0, r0, r4
	ldr r0, [r0]
	add r0, r8
	mov r4, sl
	ldrb r0, [r0]
	cmp r1, r0
	bge _0801F808
	movs r1, #0x22
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _0801F7A6
	adds r0, r7, #0
	adds r0, #0x12
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801F7A6
	adds r2, r5, #0
	adds r2, #0x2a
	lsrs r1, r0, #0x1e
	adds r0, r5, #0
	adds r0, #0x24
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne _0801F808
_0801F7A6:
	ldr r0, [r6]
	ldr r6, [r0]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x20
	ldrsh r1, [r6, r2]
	cmp r0, r1
	bgt _0801F808
	adds r0, r6, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r8, r0
	bhs _0801F808
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp ip, r0
	bhs _0801F808
	ldr r2, _0801F830 @ =gUnknown_030040E0
	ldr r1, [r2]
	movs r0, #0xae
	lsls r0, r0, #1
	cmp r1, r0
	bgt _0801F808
	adds r0, r1, #1
	str r0, [r2]
	ldr r1, _0801F834 @ =gUnknown_03003F64
	ldr r0, [r1]
	mov r5, r8
	strb r5, [r0]
	ldr r0, [r1]
	mov r2, ip
	strb r2, [r0, #1]
	ldr r0, [r1]
	mov r5, sp
	ldrb r5, [r5]
	strb r5, [r0, #2]
	ldr r0, [r1]
	strb r3, [r0, #3]
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
	ldr r1, [r4]
	mov r2, ip
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, r8
	strb r3, [r0]
_0801F808:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F818: .4byte gUnknown_0300409C
_0801F81C: .4byte gUnknown_0809092C
_0801F820: .4byte gUnknown_08499590
_0801F824: .4byte 0x0000417A
_0801F828: .4byte 0x00001432
_0801F82C: .4byte gUnknown_08090930
_0801F830: .4byte gUnknown_030040E0
_0801F834: .4byte gUnknown_03003F64

