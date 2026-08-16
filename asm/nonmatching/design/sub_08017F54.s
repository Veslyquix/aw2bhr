	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017F54
sub_08017F54: @ 0x08017F54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _08017FB4 @ =gUnknown_03002514
	ldrb r0, [r0]
	cmp r0, #1
	beq _08017FE4
	ldr r0, _08017FB8 @ =gUnknown_03002F08
	mov sb, r0
	ldrh r0, [r0, #2]
	movs r1, #0x18
	bl DivRem
	adds r5, r0, #0
	ldr r1, _08017FBC @ =gUnknown_0808E564
	mov sl, r1
	ldr r2, [r1]
	mov r8, r2
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r6, r0, #3
	mov r0, r8
	adds r0, #4
	adds r7, r6, r0
	ldr r0, [r7]
	movs r1, #8
	ldrsh r0, [r0, r1]
	movs r1, #0x18
	bl DivRem
	cmp r5, r0
	bne _08017FC0
	ldr r0, [r7]
	ldrh r0, [r0, #8]
	mov r2, sb
	strh r0, [r2, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0801815C
	b _08017FDA
	.align 2, 0
_08017FB4: .4byte gUnknown_03002514
_08017FB8: .4byte gUnknown_03002F08
_08017FBC: .4byte gUnknown_0808E564
_08017FC0:
	ldr r0, [r7]
	ldrh r0, [r0, #8]
	movs r1, #0
	mov r2, sb
	strh r0, [r2, #2]
	mov r2, r8
	adds r0, r6, r2
	strh r1, [r0, #0xe]
	mov r0, r8
	adds r0, #8
	adds r0, r6, r0
	ldr r1, _08017FE0 @ =sub_080180CC
	str r1, [r0]
_08017FDA:
	movs r3, #0
	b _08017FEC
	.align 2, 0
_08017FE0: .4byte sub_080180CC
_08017FE4:
	movs r3, #1
	ldr r0, _08018014 @ =gUnknown_0808E564
	mov sl, r0
	lsls r4, r4, #0x10
_08017FEC:
	mov r1, sl
	ldr r2, [r1]
	asrs r0, r4, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	adds r0, r3, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08018014: .4byte gUnknown_0808E564

