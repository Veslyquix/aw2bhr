	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807B148
sub_0807B148: @ 0x0807B148
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, [r0, #0x3c]
	cmp r0, #0
	bne _0807B21C
	ldr r0, _0807B200 @ =gUnknown_081D9320
	ldr r1, [r0]
	ldrb r1, [r1, #8]
	subs r4, r1, #1
	adds r7, r0, #0
	cmp r4, #0
	blt _0807B1AE
	ldr r0, _0807B204 @ =gUnknown_086160DC
	mov r8, r0
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	adds r6, r0, r1
	lsls r0, r4, #0xc
	movs r1, #0x90
	lsls r1, r1, #8
	adds r5, r0, r1
_0807B17A:
	ldr r0, [r7]
	ldrb r0, [r0, #8]
	subs r0, #1
	lsls r0, r0, #1
	mov r1, r8
	adds r2, r0, r1
	ldr r1, _0807B208 @ =gUnknown_08616100
	adds r0, r0, r1
	ldrh r0, [r0]
	muls r0, r4, r0
	ldrh r2, [r2]
	adds r0, r0, r2
	ldr r1, _0807B20C @ =0x000001FF
	ands r0, r1
	adds r2, r6, #0
	orrs r2, r5
	movs r1, #0x30
	movs r3, #0
	bl sub_08043FD8
	subs r6, #0x24
	ldr r0, _0807B210 @ =0xFFFFF000
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _0807B17A
_0807B1AE:
	movs r4, #0
	ldr r0, [r7]
	ldrb r1, [r0, #9]
	cmp r4, r1
	bge _0807B26C
	ldr r7, _0807B214 @ =gUnknown_086160E4
	adds r6, r0, #0
	movs r5, #0xb6
	lsls r5, r5, #1
_0807B1C0:
	ldrb r0, [r6, #9]
	subs r0, #1
	lsls r2, r0, #2
	adds r2, r2, r7
	ldr r1, _0807B218 @ =gUnknown_08616106
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #2
	subs r0, r0, r4
	muls r1, r0, r1
	ldr r0, [r2]
	subs r0, r0, r1
	ldr r1, _0807B20C @ =0x000001FF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	adds r2, r4, #0
	adds r2, #0xc
	lsls r2, r2, #0xc
	orrs r2, r5
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043FD8
	adds r5, #0x24
	adds r4, #1
	ldrb r0, [r6, #9]
	cmp r4, r0
	blt _0807B1C0
	b _0807B26C
	.align 2, 0
_0807B200: .4byte gUnknown_081D9320
_0807B204: .4byte gUnknown_086160DC
_0807B208: .4byte gUnknown_08616100
_0807B20C: .4byte 0x000001FF
_0807B210: .4byte 0xFFFFF000
_0807B214: .4byte gUnknown_086160E4
_0807B218: .4byte gUnknown_08616106
_0807B21C:
	movs r4, #0
	ldr r0, _0807B278 @ =gUnknown_0202FDEC
	ldrb r1, [r0, #8]
	cmp r4, r1
	bge _0807B26C
	ldr r7, _0807B27C @ =gUnknown_086160F0
	adds r6, r0, #0
	movs r5, #0x80
	lsls r5, r5, #1
_0807B22E:
	ldrb r0, [r6, #8]
	subs r0, #1
	lsls r2, r0, #2
	adds r2, r2, r7
	ldr r1, _0807B280 @ =gUnknown_0861610C
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #3
	subs r0, r0, r4
	muls r1, r0, r1
	ldr r0, [r2]
	subs r0, r0, r1
	ldr r1, _0807B284 @ =0x000001FF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	adds r2, r4, #0
	adds r2, #9
	lsls r2, r2, #0xc
	orrs r2, r5
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043FD8
	adds r5, #0x24
	adds r4, #1
	ldrb r0, [r6, #8]
	cmp r4, r0
	blt _0807B22E
_0807B26C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B278: .4byte gUnknown_0202FDEC
_0807B27C: .4byte gUnknown_086160F0
_0807B280: .4byte gUnknown_0861610C
_0807B284: .4byte 0x000001FF

