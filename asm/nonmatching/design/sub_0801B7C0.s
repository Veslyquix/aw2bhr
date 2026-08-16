	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B7C0
sub_0801B7C0: @ 0x0801B7C0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	mov sb, r1
	ldr r6, _0801B7DC @ =gUnknown_03002B80
	ldrb r0, [r7]
	cmp r0, #0
	bne _0801B7E0
	movs r0, #1
	rsbs r0, r0, #0
	b _0801B88C
	.align 2, 0
_0801B7DC: .4byte gUnknown_03002B80
_0801B7E0:
	movs r5, #0
	mov r8, r5
	ldrb r0, [r6]
	cmp r0, #1
	beq _0801B818
	ldr r0, _0801B898 @ =0x0000025B
	adds r4, r6, r0
_0801B7EE:
	ldrb r0, [r4]
	cmp r0, sb
	bne _0801B800
	adds r0, r6, r5
	adds r1, r7, #0
	bl sub_0808B694
	cmp r0, #0
	beq _0801B88A
_0801B800:
	adds r0, r6, r5
	bl sub_0808B6B0
	adds r5, r5, r0
	adds r5, #1
	adds r4, #4
	movs r1, #1
	add r8, r1
	adds r0, r6, r5
	ldrb r0, [r0]
	cmp r0, #1
	bne _0801B7EE
_0801B818:
	adds r0, r6, r5
	adds r1, r7, #0
	bl sub_0808B678
	ldr r0, _0801B89C @ =gUnknown_03002B6C
	ldr r1, [r0]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xd6
	lsls r2, r2, #2
	adds r4, r6, r2
	ldrh r2, [r4]
	ldr r0, _0801B8A0 @ =0x000003FF
	ands r0, r2
	lsls r0, r0, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	adds r1, r1, r0
	adds r0, r7, #0
	mov r2, sb
	bl sub_0801B8D0
	adds r3, r0, #0
	mov r1, r8
	lsls r0, r1, #2
	adds r0, r6, r0
	ldrh r2, [r4]
	mov ip, r2
	movs r2, #0x96
	lsls r2, r2, #2
	adds r1, r0, r2
	mov r2, ip
	strh r2, [r1]
	asrs r1, r3, #1
	mov ip, r1
	ldr r2, _0801B8A4 @ =0x0000025A
	adds r1, r0, r2
	mov r2, ip
	strb r2, [r1]
	ldr r1, _0801B898 @ =0x0000025B
	adds r0, r0, r1
	mov r2, sb
	strb r2, [r0]
	ldrh r0, [r4]
	adds r0, r0, r3
	strh r0, [r4]
	adds r0, r7, #0
	bl sub_0808B6B0
	adds r3, r0, #0
	adds r0, r5, r3
	adds r0, #1
	adds r0, r6, r0
	movs r1, #1
	strb r1, [r0]
_0801B88A:
	mov r0, r8
_0801B88C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801B898: .4byte 0x0000025B
_0801B89C: .4byte gUnknown_03002B6C
_0801B8A0: .4byte 0x000003FF
_0801B8A4: .4byte 0x0000025A

