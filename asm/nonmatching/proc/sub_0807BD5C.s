	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807BD5C
sub_0807BD5C: @ 0x0807BD5C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0807BDF8 @ =gUnknown_0822DC08
	ldr r4, _0807BDFC @ =gUnknown_0200FC50
	adds r1, r4, #0
	bl sub_08011CAC
	ldr r0, _0807BE00 @ =0x06010080
	mov r8, r0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r7, r4, r0
	ldr r5, _0807BE04 @ =0x06010000
	movs r6, #2
_0807BD7A:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x20
	bl CpuFastSet
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x20
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #1
	add r8, r0
	adds r7, #0x80
	adds r5, r5, r0
	adds r4, #0x80
	subs r6, #1
	cmp r6, #0
	bge _0807BD7A
	ldr r4, _0807BE08 @ =gUnknown_02010450
	ldr r1, _0807BE0C @ =0x06010300
	adds r0, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	ldr r0, _0807BE10 @ =0x060103C0
	mov r8, r0
	ldr r0, _0807BE14 @ =0xFFFFFD80
	adds r5, r4, r0
	ldr r7, _0807BE18 @ =0x06010380
	ldr r0, _0807BE1C @ =0xFFFFF980
	adds r4, r4, r0
	movs r6, #9
_0807BDBC:
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x10
	bl CpuFastSet
	adds r0, r5, #0
	mov r1, r8
	movs r2, #0x10
	bl CpuFastSet
	movs r0, #0x80
	add r8, r0
	adds r5, #0x40
	adds r7, #0x80
	adds r4, #0x40
	subs r6, #1
	cmp r6, #0
	bge _0807BDBC
	ldr r0, _0807BE20 @ =gUnknown_0822DE80
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807BDF8: .4byte gUnknown_0822DC08
_0807BDFC: .4byte gUnknown_0200FC50
_0807BE00: .4byte 0x06010080
_0807BE04: .4byte 0x06010000
_0807BE08: .4byte gUnknown_02010450
_0807BE0C: .4byte 0x06010300
_0807BE10: .4byte 0x060103C0
_0807BE14: .4byte 0xFFFFFD80
_0807BE18: .4byte 0x06010380
_0807BE1C: .4byte 0xFFFFF980
_0807BE20: .4byte gUnknown_0822DE80

