	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808A978
sub_0808A978: @ 0x0808A978
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _0808AA64 @ =gSinLut
	mov sb, r0
	movs r1, #0x4c
	adds r1, r1, r7
	mov r8, r1
	ldrb r0, [r1]
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	mov sl, r1
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r3, _0808AA68 @ =gUnknown_0848B6A0
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #2
	movs r1, #0
	mov r2, sl
	bl PutSpriteExt
	ldr r3, _0808AA6C @ =gUnknown_08615C62
	movs r0, #0x40
	str r0, [sp]
	movs r0, #0
	movs r1, #0x18
	movs r2, #8
	bl PutSprite
	movs r4, #0
	ldr r6, _0808AA70 @ =gUnknown_081D9480
	movs r5, #0x58
_0808AA34:
	lsls r1, r4, #5
	str r5, [sp]
	movs r0, #1
	movs r2, #0x18
	ldr r3, [r6]
	bl PutSpriteExt
	adds r4, #1
	cmp r4, #7
	ble _0808AA34
	adds r1, r7, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AA64: .4byte gSinLut
_0808AA68: .4byte gUnknown_0848B6A0
_0808AA6C: .4byte gUnknown_08615C62
_0808AA70: .4byte gUnknown_081D9480

