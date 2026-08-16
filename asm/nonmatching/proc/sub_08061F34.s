	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061F34
sub_08061F34: @ 0x08061F34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _08062008 @ =gUnknown_0816DB20
	mov r0, sp
	movs r2, #5
	bl sub_0808B6E8
	ldr r2, _0806200C @ =gUnknown_030046B8
	ldr r1, _08062010 @ =gUnknown_030045C0
	movs r0, #0
	strb r0, [r1]
	strb r0, [r2]
	movs r5, #0
	ldr r1, _08062014 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r5, r0
	bge _08061FF6
	adds r6, r1, #0
_08061F62:
	movs r4, #0
	ldr r0, [r6]
	adds r1, r5, #1
	mov sl, r1
	ldrh r0, [r0]
	cmp r4, r0
	bge _08061FEC
	ldr r2, _08062010 @ =gUnknown_030045C0
	mov sb, r2
	ldr r3, _08062018 @ =gUnknown_085767F2
	mov r8, r3
	ldr r7, _0806200C @ =gUnknown_030046B8
_08061F7A:
	ldr r0, _0806201C @ =gUnknown_030033EC
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_0802700C
	lsls r0, r0, #0x18
	lsls r3, r5, #1
	cmp r0, #0
	bne _08061FBA
	ldr r1, [r6]
	ldr r2, _08062020 @ =0x0000417A
	adds r0, r1, r2
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _08062024 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r0, #0x1f
	ands r0, r1
	add r0, r8
	ldrb r0, [r0]
	lsrs r0, r0, #1
	mov r2, sp
	adds r1, r2, r0
	mov r2, sb
	ldrb r0, [r2]
	ldrb r1, [r1]
	orrs r0, r1
	strb r0, [r2]
_08061FBA:
	ldr r2, [r6]
	ldr r1, _08062020 @ =0x0000417A
	adds r0, r2, r1
	adds r0, r0, r3
	ldrh r1, [r0]
	adds r1, r1, r4
	ldr r3, _08062024 @ =0x00001432
	adds r0, r2, r3
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	add r0, r8
	ldrb r0, [r0]
	lsrs r0, r0, #1
	mov r3, sp
	adds r1, r3, r0
	ldrb r0, [r7]
	ldrb r1, [r1]
	orrs r0, r1
	strb r0, [r7]
	adds r4, #1
	ldrh r2, [r2]
	cmp r4, r2
	blt _08061F7A
_08061FEC:
	mov r5, sl
	ldr r0, [r6]
	ldrh r0, [r0, #2]
	cmp r5, r0
	blt _08061F62
_08061FF6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062008: .4byte gUnknown_0816DB20
_0806200C: .4byte gUnknown_030046B8
_08062010: .4byte gUnknown_030045C0
_08062014: .4byte gUnknown_08499590
_08062018: .4byte gUnknown_085767F2
_0806201C: .4byte gUnknown_030033EC
_08062020: .4byte 0x0000417A
_08062024: .4byte 0x00001432

