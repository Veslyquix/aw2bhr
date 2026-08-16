	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807B360
sub_0807B360: @ 0x0807B360
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	ldr r0, _0807B4C0 @ =gUnknown_08227F3C
	ldr r4, _0807B4C4 @ =gUnknown_0200FC50
	adds r1, r4, #0
	bl sub_08011CAC
	ldr r0, _0807B4C8 @ =0x06010040
	mov r8, r0
	movs r1, #0x90
	lsls r1, r1, #6
	adds r7, r4, r1
	ldr r6, _0807B4CC @ =0x06010000
	movs r2, #0x80
	lsls r2, r2, #6
	adds r4, r4, r2
	movs r5, #9
_0807B38A:
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl CpuFastSet
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x10
	bl CpuFastSet
	movs r0, #0x80
	add r8, r0
	adds r7, #0x40
	adds r6, #0x80
	adds r4, #0x40
	subs r5, #1
	cmp r5, #0
	bge _0807B38A
	movs r1, #0x4c
	add r1, sb
	mov sl, r1
	ldr r0, _0807B4C4 @ =gUnknown_0200FC50
	ldr r2, _0807B4D0 @ =0x06010540
	mov r8, r2
	movs r1, #0x9a
	lsls r1, r1, #6
	adds r7, r0, r1
	ldr r6, _0807B4D4 @ =0x06010500
	movs r2, #0x8a
	lsls r2, r2, #6
	adds r4, r0, r2
	movs r5, #5
_0807B3CA:
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl CpuFastSet
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x10
	bl CpuFastSet
	movs r0, #0x80
	add r8, r0
	adds r7, #0x40
	adds r6, #0x80
	adds r4, #0x40
	subs r5, #1
	cmp r5, #0
	bge _0807B3CA
	ldr r0, _0807B4C4 @ =gUnknown_0200FC50
	ldr r1, _0807B4D8 @ =0x06010840
	mov r8, r1
	movs r2, #0xb0
	lsls r2, r2, #6
	adds r7, r0, r2
	ldr r6, _0807B4DC @ =0x06010800
	movs r1, #0xa0
	lsls r1, r1, #6
	adds r4, r0, r1
	movs r5, #3
_0807B404:
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl CpuFastSet
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x10
	bl CpuFastSet
	movs r2, #0x80
	add r8, r2
	adds r7, #0x40
	adds r6, #0x80
	adds r4, #0x40
	subs r5, #1
	cmp r5, #0
	bge _0807B404
	movs r5, #0
	ldr r4, _0807B4E0 @ =gUnknown_02013750
	ldr r1, _0807B4E4 @ =0x06010A00
	adds r0, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r1, _0807B4E8 @ =0x06010A80
	movs r2, #0x20
	bl CpuFastSet
	ldr r2, _0807B4EC @ =0xFFFFFE00
	adds r0, r4, r2
	ldr r1, _0807B4F0 @ =0x06010B00
	movs r2, #0x10
	bl CpuFastSet
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r1, _0807B4F4 @ =0x06010B40
	movs r2, #0x10
	bl CpuFastSet
	ldr r2, _0807B4F8 @ =0xFFFFFE40
	adds r0, r4, r2
	ldr r1, _0807B4FC @ =0x06010B80
	movs r2, #0x20
	bl CpuFastSet
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r1, _0807B500 @ =0x06010C00
	movs r2, #0x20
	bl CpuFastSet
	ldr r2, _0807B504 @ =0xFFFFF800
	adds r0, r4, r2
	ldr r1, _0807B508 @ =0x06010C80
	movs r2, #0x10
	bl CpuFastSet
	ldr r0, _0807B50C @ =0xFFFFFC00
	adds r4, r4, r0
	ldr r1, _0807B510 @ =0x06010CC0
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	ldr r0, _0807B514 @ =gUnknown_0822AA80
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0xc0
	bl sub_08013618
	ldr r1, _0807B518 @ =gUnknown_0202FDEC
	ldrh r0, [r1, #0xa]
	mov r2, sb
	str r0, [r2, #0x58]
	ldrh r0, [r1, #0xc]
	str r0, [r2, #0x5c]
	mov r0, sl
	strh r5, [r0]
	movs r0, #0x1e
	str r0, [r2, #0x60]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B4C0: .4byte gUnknown_08227F3C
_0807B4C4: .4byte gUnknown_0200FC50
_0807B4C8: .4byte 0x06010040
_0807B4CC: .4byte 0x06010000
_0807B4D0: .4byte 0x06010540
_0807B4D4: .4byte 0x06010500
_0807B4D8: .4byte 0x06010840
_0807B4DC: .4byte 0x06010800
_0807B4E0: .4byte gUnknown_02013750
_0807B4E4: .4byte 0x06010A00
_0807B4E8: .4byte 0x06010A80
_0807B4EC: .4byte 0xFFFFFE00
_0807B4F0: .4byte 0x06010B00
_0807B4F4: .4byte 0x06010B40
_0807B4F8: .4byte 0xFFFFFE40
_0807B4FC: .4byte 0x06010B80
_0807B500: .4byte 0x06010C00
_0807B504: .4byte 0xFFFFF800
_0807B508: .4byte 0x06010C80
_0807B50C: .4byte 0xFFFFFC00
_0807B510: .4byte 0x06010CC0
_0807B514: .4byte gUnknown_0822AA80
_0807B518: .4byte gUnknown_0202FDEC

